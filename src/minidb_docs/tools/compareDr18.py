import os
import re


def getCols(filepath):
    cols = []
    match1 = re.search(
        r"Summary\n+\-+\n+((?:.|\n)+)?\n+Columns\n+\-+\n+((?:.|\n)+)",
        open(filepath, "r").read(),
    )
    summary, columns = match1.groups()
    column_list = columns.strip().split("\n")
    for column in column_list:
        if column.strip() == "":
            continue

        match_col = re.search(r"(\w+)\s*\-?\s*([^\[]*)(?:\s*\[(.*)\])?", column.strip())
        if not match_col:
            raise ValueError(f"Column {column!r} is badly formatted.")

        column_name, column_description, column_units = match_col.groups()
        cols.append(column_name)

    return set(cols)


dr18 = os.listdir("dr18")
dr19 = os.listdir("dr19")

for f in dr19:
    if "dr19" not in f:
        continue
    tab = f.strip("dr19_")
    inDR18 = False
    for f2 in dr18:
        if tab in f2 and "catalog_to" not in f2:
            inDR18 = True
            cols18 = getCols(os.path.join("dr18", f2))
            cols19 = getCols(os.path.join("dr19", f))
            diff = cols18.difference(cols19)
            if len(diff) > 0:
                print(f, f2, diff)
    if not inDR18:
        print(f, "NEW")
