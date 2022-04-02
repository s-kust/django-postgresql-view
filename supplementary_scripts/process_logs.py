import argparse
import io
import pandas as pd


def myKeyFunc(aString):
    _, _, end = aString.partition('/rooms')
    return end


parser = argparse.ArgumentParser()
parser.add_argument("filename")
args = parser.parse_args()
print(args.filename)

with open(args.filename) as file:
    lines = file.read().splitlines()

lines_processed = []
for line in lines:
    _, _, end = line.partition('/rooms')
    if not end:
        continue
    if end[0] == '2':
        line = line + "; VIEW"
        lines_processed.append(line)
        continue
    if end[0] == '/':
        line = line + "; MAIN_ROOM"
        lines_processed.append(line)
        continue
    line = line + "; OTHER"
    lines_processed.append(line)

# print("Lines after processing:")
# print(lines_processed)
# print()
df = pd.read_csv(io.StringIO('\n'.join(lines_processed)), delimiter=";",
                 delim_whitespace=False, header=None)
df.columns = ['MsgType', 'Path', 'ExecutionTime', 'Type']
print(df.head())
print("Number of rows (log records) - ", df.shape[0])
print()
print("Mean execution time by query type:")
print(df.groupby('Type')['ExecutionTime'].mean())
