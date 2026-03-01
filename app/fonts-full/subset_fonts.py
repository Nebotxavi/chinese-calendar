#!/usr/bin/env python3
"""
Subset Chinese fonts to include only the characters used by the app.

Run this whenever proverbs.min.json changes or new Chinese text is added.

Prerequisites:
    pip3 install fonttools brotli

Usage:
    python3 fonts-full/subset_fonts.py
    (run from the app/ directory)
"""

import json
import os
import re
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
APP_DIR = os.path.dirname(SCRIPT_DIR)

PROVERBS_PATH = os.path.join(APP_DIR, "assets", "data", "proverbs.min.json")
OUTPUT_DIR = os.path.join(APP_DIR, "assets", "fonts")

# Heavenly stems (天干)
HEAVENLY_STEMS = "甲乙丙丁戊己庚辛壬癸"

# Earthly branches (地支)
EARTHLY_BRANCHES = "子丑寅卯辰巳午未申酉戌亥"

# Five elements (五行)
FIVE_ELEMENTS = "金木水火土"

# Lunar month names (used by lunar package)
LUNAR_MONTHS = "正二三四五六七八九十冬腊"

# Lunar day characters (used by lunar package)
LUNAR_DAYS = "初一二三四五六七八九十廿"

# 24 solar term names
SOLAR_TERMS = (
    "立春雨水惊蛰春分清明谷雨"
    "立夏小满芒种夏至小暑大暑"
    "立秋处暑白露秋分寒露霜降"
    "立冬小雪大雪冬至小寒大寒"
)

# CJK Unicode range for character detection
CJK_PATTERN = re.compile(r"[\u4e00-\u9fff]")


def extract_chinese_chars(text: str) -> set[str]:
    """Extract all unique Chinese characters from text."""
    return set(CJK_PATTERN.findall(text))


def load_proverb_chars() -> set[str]:
    """Load all Chinese characters from proverbs JSON."""
    with open(PROVERBS_PATH, encoding="utf-8") as f:
        proverbs = json.load(f)

    chars = set()
    for proverb in proverbs:
        chars.update(extract_chinese_chars(proverb["chinese"]))
    print(f"  Loaded {len(proverbs)} proverbs with {len(chars)} unique characters")
    return chars


def build_charset(name: str, chars: str) -> str:
    """Deduplicate and sort a character set."""
    unique = sorted(set(chars))
    result = "".join(unique)
    print(f"  {name}: {len(result)} characters")
    return result


def subset_font(source: str, output: str, chars: str) -> None:
    """Run pyftsubset to create a subsetted font."""
    import subprocess

    chars_file = os.path.join(SCRIPT_DIR, ".subset_chars.tmp")
    with open(chars_file, "w", encoding="utf-8") as f:
        f.write(chars)

    cmd = [
        "pyftsubset",
        source,
        f"--text-file={chars_file}",
        f"--output-file={output}",
        "--layout-features=*",
    ]

    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"  ERROR: {result.stderr}")
        sys.exit(1)

    os.remove(chars_file)

    source_size = os.path.getsize(source)
    output_size = os.path.getsize(output)
    reduction = (1 - output_size / source_size) * 100
    print(
        f"  {os.path.basename(output)}: "
        f"{source_size / 1024:.0f}K -> {output_size / 1024:.0f}K "
        f"({reduction:.1f}% reduction)"
    )


def main() -> None:
    print("=== Loading character sets ===")

    proverb_chars = load_proverb_chars()
    solar_term_chars = extract_chinese_chars(SOLAR_TERMS)

    # NotoSerifSC: digits + lunar date display characters
    notoserif_chars = build_charset(
        "NotoSerifSC",
        "0123456789" + HEAVENLY_STEMS + EARTHLY_BRANCHES + LUNAR_MONTHS + LUNAR_DAYS + "年月闰",
    )

    # NotoSansSC: Gan/Zhi + element display
    notosans_chars = build_charset(
        "NotoSansSC",
        HEAVENLY_STEMS + EARTHLY_BRANCHES + FIVE_ELEMENTS + "日",
    )

    # MaShanZheng: solar terms + all proverb characters
    mashanzheng_all = solar_term_chars | proverb_chars
    mashanzheng_chars = build_charset(
        "MaShanZheng",
        "".join(mashanzheng_all),
    )

    # ZhiMangXing: only 宜 and 忌
    zhimangxing_chars = build_charset("ZhiMangXing", "宜忌")

    print("\n=== Subsetting fonts ===")

    fonts = [
        ("NotoSerifSC-Variable.ttf", notoserif_chars),
        ("NotoSansSC-Variable.ttf", notosans_chars),
        ("MaShanZheng-Regular.ttf", mashanzheng_chars),
        ("ZhiMangXing-Regular.ttf", zhimangxing_chars),
    ]

    for filename, chars in fonts:
        source = os.path.join(SCRIPT_DIR, filename)
        output = os.path.join(OUTPUT_DIR, filename)

        if not os.path.exists(source):
            print(f"  SKIP {filename}: full font not found in fonts-full/")
            continue

        subset_font(source, output, chars)

    print("\nDone. Subsetted fonts written to assets/fonts/")


if __name__ == "__main__":
    main()
