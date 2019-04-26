import pandas as pd


def gff2coverage(annotations, reference):
    print('Calculating coverage for %s in %s' % (annotations, reference,))
    df_ann = pd.read_csv(annotations, index_col=False, sep='\t', header=None, comment='#')
    df_ann.columns = ['seqname', 'source', 'feature', 'start', 'end', 'score', 'strand', 'frame', 'attribute']

    df_ref = pd.read_csv(reference, index_col=False, sep='\t', header=None, comment='#')
    df_ref.columns = ['seqname', 'source', 'feature', 'start', 'end', 'score', 'strand', 'frame', 'attribute']
    total = {}
    for k, v in df_ref.iterrows():
        total[v.seqname] = v.end

    overlapped = {}
    for k, v in df_ann.iterrows():
        overlapped.setdefault(v.seqname, []).append((v.start, v.end))

    sequences = df_ref.seqname.unique().tolist()
    for seqname in sequences:
        if not seqname in overlapped:
            continue
        overlapped[seqname] = merge_overlap(overlapped[seqname])

    gran_total_length = 0
    gran_ref_length = 0
    for seqname in sequences:
        current_ref = df_ref[(df_ref.seqname == seqname)].iloc[0]
        ref_len = abs(current_ref.end - current_ref.start)
        gran_ref_length += ref_len

        if not seqname in overlapped:
            continue
        current = overlapped[seqname]
        total_length = 0

        for (start, end) in current:
            total_length += abs(end - start)

        perc = total_length * 100.0 / ref_len
        gran_total_length += total_length

        print('seqname %s len: %s covered: %s percentage: %f ' % (seqname, ref_len, total_length, perc,))
    gran_perc = gran_total_length * 100.0 / gran_ref_length
    print('Total len: %s covered: %s percentage: %f ' % (gran_ref_length, gran_total_length, gran_perc,))

def calc_coverage_part(df_ann, ref_len):
    seqs = []
    for k, v in df_ann.iterrows():
        seqs.append((v.start, v.end))
    seqs_non_overlapped = merge_overlap(seqs)
    total_length = 0
    for (start, end) in seqs_non_overlapped:
        total_length += abs(end - start)
    perc = total_length * 100.0 / ref_len
    return perc

def merge_overlap(intervals):
    sorted_by_lower_bound = sorted(intervals, key=lambda tup: tup[0])
    merged = []
    for higher in sorted_by_lower_bound:
        if not merged:
            merged.append(higher)
        else:
            lower = merged[-1]
            # test for intersection between lower and higher:
            # we know via sorting that lower[0] <= higher[0]
            if higher[0] <= lower[1]:
                upper_bound = max(lower[1], higher[1])
                merged[-1] = (lower[0], upper_bound)  # replace by merged interval
            else:
                merged.append(higher)
    return merged


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()  # pylint: disable=invalid-name
    parser.add_argument("-a", "--annotation", help="Annotation file (.gff3 format)", required=True)
    parser.add_argument("-r", "--reference", help="Reference genome file (.gff3 format)", required=True)
    args = parser.parse_args()  # pylint: disable=invalid-name
    gff2coverage(args.annotation, args.reference)
