#!/usr/bin/env python3
"""Create a Markdown-friendly ASCII table for side-by-side code blocks.

Add programs to the empty `programs` dictionary below, or run this file and
enter the programs interactively.
"""

from __future__ import annotations

import sys


programs: dict[str, str] = {
    "program1": 
    """
struct IMEI
{
    char cc[2];
    char mfc[2];
    char sar[2];
    char mn[4];
    char usn[6];
}; // 16 Bytes total

void main()
{
    struct IMEI i;
    
    strcpy(i.cc, "10");
    strcpy(i.mfc, "35");
    strcpy(i.sar, "12");
    strcpy(i.mn, "1769"); 
    strcpy(i.usn, "1AB341");
    
    // Outputs: 10351217691AB341
    printf("%s%s%s%s%s", i.cc, i.mfc, 
            i.sar, i.mn, i.usn); 
/*
      cc     mfc    sar    mn     usn
   ┌──────┬──────┬──────┬──────┬────────┐
   │  10  │  35  │  12  │ 1769 │ 1AB341 │
   └──────┴──────┴──────┴──────┴────────┘
    2 char 2 char 2 char 4 char  6 char
*/
}
    """,

    "program2":
    """
union OIMEI
{
    struct IMEI
    {
        char cc[2];
        char mfc[2];
        char sar[2];
        char mn[4];
        char usn[6];
    } in; // 16 Bytes
    
    char obuffer[16];
}; // 16 Bytes total

void main()
{
    union OIMEI o;
    
    strcpy(o.in.cc, "10");
    strcpy(o.in.mfc, "35");
    strcpy(o.in.sar, "12");
    strcpy(o.in.mn, "1769");
    strcpy(o.in.usn, "1AB341");
    
    // Outputs 10351217691AB341
    printf("%s", o.obuffer); 
}
/*
        cc     mfc    sar    mn      usn
     ┌──────┬──────┬──────┬──────┬────────┐
in   │  10  │  35  │  12  │ 1769 │ 1AB341 │
     └──────┴──────┴──────┴──────┴────────┘
     |<────────── obuffer[16] ───────────>|
*/
    """,

    "program3":
    """
    """,

    "program4":
    """
    """,

    "program5":
    """

    """,
}


def read_programs() -> dict[str, str]:
    """Read program names and multiline code from stdin."""
    collected: dict[str, str] = {}
    interactive = sys.stdin.isatty()

    if interactive:
        print("Enter program name as program1, program2, etc.")
        print("Paste code after each name. Type END on a new line to finish code.")
        print("Press Enter without a name when all programs are added.\n")

    while True:
        name = input("Program name: " if interactive else "").strip()
        if not name:
            break

        if interactive:
            print(f"Paste code for {name}:")
        lines: list[str] = []
        while True:
            line = input()
            if line == "END":
                break
            lines.append(line)

        collected[name] = "\n".join(lines)
        if interactive:
            print()

    return collected


def code_lines(code: str, language: str = "c") -> list[str]:
    """Wrap code in a fenced code block and split it into table rows."""
    return [f"```{language}", *code.splitlines(), "```"]


def column_width(lines: list[str]) -> int:
    """Return the printable width needed for one code column."""
    return max((len(line) for line in lines), default=0)


def make_ascii_table(items: dict[str, str], language: str = "c") -> str:
    """Build an ASCII table with one empty column between programs."""
    if not items:
        return ""

    columns = [code_lines(code, language) for code in items.values()]
    widths = [column_width(column) for column in columns]
    height = max(len(column) for column in columns)

    border_parts: list[str] = []
    for index, width in enumerate(widths):
        border_parts.append("-" * (width + 2))
        if index != len(widths) - 1:
            border_parts.append("-" * 3)
    border = "+" + "+".join(border_parts) + "+"

    rows = [border]
    for row_index in range(height):
        cells: list[str] = []
        for index, column in enumerate(columns):
            value = column[row_index] if row_index < len(column) else ""
            cells.append(f" {value:<{widths[index]}} ")
            if index != len(columns) - 1:
                cells.append("   ")
        rows.append("|" + "|".join(cells) + "|")
    rows.append(border)

    return "\n".join(rows)


def main() -> None:
    table_programs = programs or read_programs()
    table = make_ascii_table(table_programs)

    if table:
        print(table)


if __name__ == "__main__":
    main()
