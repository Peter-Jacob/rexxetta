# REXX Variable Name Analyzer Documentation

## Overview

The `fixVars.rexx` script analyzes REXX source code to identify variable names, categorize them as either "solid" (starting with a letter) or "bizarre" (starting with other characters), and optionally rename the bizarre variables to more standardized names.

## Features

- Parses REXX source code files
- Identifies variable names from assignment statements and other contexts
- Categorizes variables into "solid" and "bizarre" groups
- Generates cross-reference listings of variable usage
- Automatically renames "bizarre" variables to standardized names
- Preserves comments and string literals during processing
- Handles stem variables (with periods) appropriately
- Can process an entire directory of REXX files in batch mode

## Usage

```
rexx fixVars.rexx [filename|directory]
```

If no filename is provided, the script currently uses a hardcoded default path:
`C:\Temp\CREXX\Rosetta\15-puzzle-game.rexx`

When a directory is specified, the script will analyze and process all REXX files (*.rexx) in that directory, migrating bizarre variable names in each file.

## How It Works

1. **Initialization**: Sets up counters and processing flags
2. **File Import**: Reads the target REXX file line by line (or processes each file in a directory)
3. **Processing**:
   - Masks comments and string literals to protect them from modification
   - Splits lines into individual statements (separated by semicolons)
   - Identifies variable assignments by looking for equals signs
   - Categorizes variables as "solid" or "bizarre" based on naming
   - Tracks line numbers where each variable appears
4. **Reporting**: Displays lists of identified variables
5. **Renaming**: Replaces "bizarre" variable names with standardized alternatives
6. **Output**: Displays the modified REXX code

## Key Functions

### `varbucket`
Analyzes variable names and categorizes them as either "solid" or "bizarre".

### `change_weird_names`
Replaces bizarre variable names with standardized alternatives (newV1, newV2, etc.).

### `mask_strings` and `mask_comments`
Temporarily encodes string literals and comments to protect them from modification during variable renaming.

### `xref_solid`
Generates a cross-reference listing of all solid variable names.

### `final_rexx`
Outputs the final modified REXX code.

### `process_directory`
Scans a directory for REXX files and processes each one, applying variable migration to all files.

## Example Output

The script produces three main sections of output:

1. **Bizarre Variable Names**: Lists all variables with non-standard naming (those that don't start with a letter) and their replacements
   ```
   bizarre Variable Names
   ----------------------
   001 _count         -> newV1 12 45 67
   002 $.             -> newV2. 23 89
   ```

2. **Solid Variable Names** (if enabled): Lists all properly named variables
   ```
   solid Variable Names
   --------------------
   001 counter         12 34 56
   002 fileName        7 18
   ```

3. **Modified Code**: The REXX code with bizarre variables renamed

## Notes

- The script handles nested block comments and string literals correctly
- Variable names that appear in comments or string literals are preserved
- The script can process REXX files with multiple statements per line
- Stem variables (ending with a period) are properly identified and preserved
- When processing a directory, a summary report of all processed files is generated

## Limitations

- The current implementation does not yet support the PARSE statement 
- The current implementation has a hardcoded default filename
- The script may not handle all edge cases in complex REXX syntax
- Variable detection is based on assignment operations only 