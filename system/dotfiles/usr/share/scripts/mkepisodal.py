#!/usr/bin/env python3.6
"""
Print commands to rename files in directory into
"<show> S<season>E<episode>.<ext>" format.
"""

import sys
import os
import shutil
import re

from argparse import ArgumentParser
from pathlib import Path


def escape_path(path: str):
    quoted = path.replace('"', '\\"')
    return f'"{quoted}"'

def mkepisodal(show_name: str, season_num: int, directory: Path,
               start_at: int=1):
    files = sorted(list(directory.iterdir()), key=lambda s: s.name.lower())

    # Ignore files that begin with a "." (i.e. hidden):
    files = [x for x in files if not str(x).startswith(".")]

    for i, episode in enumerate(files):
        episode_num = i + start_at
        ext = episode.suffix
        newname = f"{show_name} S{season_num:02d}E{episode_num:02d}{ext}"

        src_path = escape_path(str(directory / episode.name))
        dst_path = escape_path(str(directory / newname))

        print(f"mv -v {src_path} {dst_path}")


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("show_name", metavar="<show-name>",
                        help="Name of the show, e.g. 'The Simponsons'")
    parser.add_argument("season_num", metavar="<season number>", type=int,
                        help="Season number, e.g. '1'")
    parser.add_argument("directory", metavar="[directory]", nargs="?", default=".",
                        help="Path to the directory containing the show's files")
    parser.add_argument("--start-at", metavar="<num>", type=int, default="1",
                        help="Episode start number (default: 1)")
    args = parser.parse_args()

    mkepisodal(args.show_name, args.season_num, Path(args.directory),
               start_at=args.start_at)


if __name__ == "__main__":
    main()
