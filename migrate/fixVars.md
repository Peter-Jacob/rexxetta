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

## Directory Processing Workflow

When processing a directory:

1. The script uses the Windows `dir` command to list all REXX files in the specified directory and its subdirectories
2. Each file is processed individually through the `RXMigrate` procedure
3. The script maintains the original directory structure in the output
4. A summary report is generated showing:
   - Total number of files processed
   - Total number of variables changed
   - Total elapsed processing time

## Output File Structure

For each processed REXX file, the script creates:

1. **Migrated REXX file**: Contains the modified code with standardized variable names
   - Located in: `[original_path]/rexx_migrated/[subdir]/[filename].rexx`

2. **Log file**: Contains the analysis results and cross-reference information
   - Located in: `[original_path]/rexx_migrated/[subdir]/[filename].log`

The script automatically creates any necessary directories in the output path.

## How It Works

1. **Initialization**: Sets up counters and processing flags
2. **File Import**: Reads the target REXX file line by line (or processes each file in a directory)
3. **Processing**:
   - Masks comments and string literals to protect them from modification
     * Comments (both single-line and block comments) are temporarily replaced with special markers
     * String literals (in single or double quotes) are encoded with unique placeholders
     * This prevents variable names inside comments and strings from being modified
     * The original comments and strings are restored after variable renaming
     * XOR encoding is used to move characters outside the normal ASCII range
     * Each character is XORed with hex value 80 (128 decimal) to shift it into non-printable range
   - Splits lines into individual statements (separated by semicolons)
   - Identifies variable assignments by looking for equals signs
   - Categorizes variables as "solid" or "bizarre" based on naming
   - Tracks line numbers where each variable appears
4. **Reporting**: Displays lists of identified variables
5. **Renaming**: Replaces "bizarre" variable names with standardized alternatives
6. **Output**: Displays the modified REXX code

## Migration Strategy

The script follows these principles when migrating variable names:

1. **Preservation of semantics**: The meaning and behavior of the code is preserved
2. **Standardization**: Bizarre variable names are replaced with a consistent naming pattern (`newV1`, `newV2`, etc.)
3. **Stem preservation**: Variables ending with a period (stem variables) maintain their stem structure
4. **Context awareness**: Variables are only renamed in appropriate contexts, not in comments or strings
5. **Length-based processing**: Longer variable names are processed first to prevent partial replacements
6. **Cross-referencing**: All variable occurrences are tracked and reported

## Common Bizarre Variable Patterns

Examples of variable names considered "bizarre" and how they're renamed:

| Original Name | Renamed To | Description |
|---------------|------------|-------------|
| `_count`      | `newV1`    | Starts with underscore |
| `$total`      | `newV2`    | Starts with special character |
| `123value`    | `newV3`    | Starts with digit |
| `$.`          | `newV4.`   | Stem variable with special character |
| `_array.`     | `newV5.`   | Stem variable with underscore |

## Sub Functions

### `init`
**Purpose**: Initializes variables needed for processing.
**Functionality**:
- Sets up counters for tracking variables
- Initializes arrays for storing variable names
- Sets default values for processing flags
- Prepares the environment for variable analysis
- Creates output directories and files for logs and migrated code

### `import_rexx`
**Purpose**: Imports the REXX source code for analysis.
**Functionality**:
- Opens and reads the specified REXX file
- Stores the content in memory for processing
- Handles file not found errors
- Counts the number of lines in the source code

### `cipher_strings`
**Purpose**: Ciphers strings and comments to protect them from changes.
**Functionality**:
- Uses XOR with hex value 80 to encode characters
- Processes both string literals and comments
- Makes these elements invisible to the variable detection logic
- Can be called again with the same parameters to restore original text

### `varbucket`
**Purpose**: Places found variable names into either solid or bizarre buckets.
**Functionality**:
- Analyzes variable names from assignment statements
- Categorizes variables as "solid" or "bizarre" based on first character
- Tracks line numbers where each variable appears
- Handles stem variables (ending with a period) specially

### `findstrange`
**Purpose**: Checks if a bizarre variable is already in the tracking list.
**Functionality**:
- Searches the list of bizarre variables
- Returns the index if found, or 0 if not found
- Used to avoid duplicate entries in the bizarre variable list

### `findNormal`
**Purpose**: Checks if a solid variable is already in the tracking list.
**Functionality**:
- Searches the list of solid variables
- Returns the index if found, or 0 if not found
- Used to avoid duplicate entries in the solid variable list

### `BeginWord`
**Purpose**: Finds the BEGIN keyword, ensuring it is a complete word.
**Functionality**:
- Searches for the BEGIN keyword in REXX code
- Verifies it's a complete word (not part of another word)
- Used for proper parsing of block structures

### `EndWord`
**Purpose**: Finds the END keyword, ensuring it is a complete word.
**Functionality**:
- Searches for the END keyword in REXX code
- Verifies it's a complete word (not part of another word)
- Used for proper parsing of block structures

### `parseSt`
**Purpose**: Analyzes PARSE statements to identify variable names.
**Functionality**:
- Identifies PARSE statements in the code
- Extracts variable names from these statements
- Adds them to the appropriate variable bucket
- Handles different PARSE statement formats

### `change_weird_names`
**Purpose**: Changes bizarre variable names to standardized alternatives.
**Functionality**:
- Generates standardized names (newV1, newV2, etc.)
- Replaces bizarre variable names throughout the code
- Preserves stem variable structure (ending period)
- Ensures replacements don't affect comments or string literals

### `xref_solid`
**Purpose**: Cross-references solid variable names with their line numbers.
**Functionality**:
- Creates a formatted listing of all solid variables
- Shows line numbers where each variable appears
- Provides a clean, readable output

### `initial_rexx`
**Purpose**: Outputs the initial REXX code before modifications.
**Functionality**:
- Displays the original REXX code
- Used for comparison with the modified version
- Shows line numbers for reference

### `final_rexx`
**Purpose**: Outputs the final modified REXX code.
**Functionality**:
- Displays the REXX code after all modifications
- Shows line numbers for reference
- Adds a comment indicating the file was migrated with date and time

### `mask_strings`
**Purpose**: Protects string literals from modification.
**Functionality**:
- Identifies string literals (in single or double quotes)
- Uses XOR with hex value 80 to encode characters within strings
- Preserves the quote characters themselves
- Handles nested quotes correctly

### `mask_comments`
**Purpose**: Protects comments from modification.
**Functionality**:
- Identifies block comments (/* */)
- Handles nested comments with a depth counter
- Uses XOR with hex value 80 to encode characters within comments
- Preserves the comment delimiters themselves

### `dropinDelim`
**Purpose**: Removes content between specified delimiters.
**Functionality**:
- Takes input string and delimiter characters
- Removes all content between the delimiters
- Handles nested delimiters
- Used to protect content in strings and comments

**Examples**:

1. **Removing content between single quotes**:
   ```
   Input:  x = 'Hello world' + y
   Call:   dropinDelim(input, "'")
   Result: x =  + y
   ```

2. **Removing content between comment markers**:
   ```
   Input:  count = 5 /* initial count */ + 1
   Call:   dropinDelim(input, "/*", "*/")
   Result: count = 5  + 1
   ```

3. **Handling nested delimiters**:
   ```
   Input:  text = "outer "inner" text"
   Call:   dropinDelim(input, '"')
   Result: text = 
   ```

4. **Used in parsing PARSE statements**:
   ```
   Input:  parse var line word1 'delimiter' word2
   Call:   dropinDelim(input, "'")
   Result: parse var line word1  word2
   ```

This function is crucial for isolating variable names by removing string literals and comments that might contain text that looks like variable names but shouldn't be processed as such.

### `weird_sort`
**Purpose**: Sorts bizarre variable names by length.
**Functionality**:
- Uses bubble sort algorithm
- Sorts variables from longest to shortest
- Ensures longer variable names are processed first to avoid partial replacements
- Critical for preventing issues where shorter variable names are substrings of longer ones

### `dropkeywords`
**Purpose**: Removes content between specified keywords.
**Functionality**:
- Takes input string and keywords
- Removes all content between the keywords
- Used to handle special REXX constructs
- Specifically handles IF-THEN constructs to avoid false variable detection

**Examples**:

1. **Handling IF-THEN constructs**:
   ```
   Input:  x = 5; if x > 10 then y = 20; z = 30
   Call:   dropkeywords(input, "if", "then")
   Result: x = 5;  y = 20; z = 30
   ```

2. **Multiple keyword occurrences**:
   ```
   Input:  if a=1 then x=5; if b=2 then y=10
   Call:   dropkeywords(input, "if", "then")
   Result:  x=5;  y=10
   ```

This function helps prevent false variable detection in conditional statements where the condition might be mistaken for an assignment.

### `CHANGEISTRING`
**Purpose**: Case-insensitive string replacement.
**Functionality**:
- Finds all occurrences of a string regardless of case
- Replaces them with a new string
- Used for variable name replacement

**Examples**:

1. **Basic replacement**:
   ```
   Input:  total = $sum + $SUM + $Sum
   Call:   CHANGEISTRING("$sum", input, "newV1")
   Result: total = newV1 + newV1 + newV1
   ```

2. **Partial word matching**:
   ```
   Input:  $counter = $counter + 1
   Call:   CHANGEISTRING("$counter", input, "newV2")
   Result: newV2 = newV2 + 1
   ```

This function ensures that all occurrences of a variable are replaced consistently, regardless of case variations.

### `posi`
**Purpose**: Case-insensitive string position finder.
**Functionality**:
- Finds the position of a substring within a string
- Ignores case differences
- Allows specifying a starting position

**Examples**:

1. **Basic position finding**:
   ```
   Input:  "Hello World"
   Call:   posi("world", input)
   Result: 7
   ```

2. **Case-insensitive matching**:
   ```
   Input:  "Variable VARIABLE variable"
   Call:   posi("variable", input)
   Result: 1
   ```

3. **With starting position**:
   ```
   Input:  "Variable VARIABLE variable"
   Call:   posi("variable", input, 10)
   Result: 10
   ```

This function is used by CHANGEISTRING to locate variable names regardless of case.

### `getPath`
**Purpose**: Extracts the directory path from a file path.
**Functionality**:
- Takes a full file path
- Returns just the directory portion
- Handles different path separators

### `getBaseName`
**Purpose**: Extracts the base filename without extension.
**Functionality**:
- Takes a full file path
- Returns just the filename without extension
- Handles different path separators

### `createSubdirectory`
**Purpose**: Creates a directory and any necessary parent directories.
**Functionality**:
- Takes a directory path
- Creates the directory if it doesn't exist
- Creates any necessary parent directories
- Returns success/failure code

### `RXMigrate`
**Purpose**: Main procedure for migrating a single REXX file.
**Functionality**:
- Initializes the environment
- Imports the REXX code
- Processes the code to identify variables
- Changes bizarre variable names
- Outputs the modified code
- Returns success/failure code

## Performance Considerations

- The script processes files line by line for memory efficiency
- String operations are optimized for REXX's string handling capabilities
- For large files or directories, processing may take significant time
- XOR encoding/decoding of strings and comments is performed twice (once to mask, once to unmask)
- The script tracks and reports processing time for each file and the total operation
- Sorting variables by length before replacement is a key optimization

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

## Troubleshooting

Common issues and solutions:

1. **Permission errors**: Ensure you have write access to the output directory
2. **Missing files**: Check that the input path exists and contains REXX files
3. **Incomplete variable renaming**: Check for variables in complex expressions that might be missed
4. **Unexpected changes**: Verify that comments and strings are properly preserved
5. **Performance issues**: For very large directories, consider processing subdirectories separately

## Extending the Script

To extend the script for additional functionality:

1. **Additional variable detection contexts**: Add code to identify variables in other REXX constructs
2. **Custom naming patterns**: Modify the `change_weird_names` function to use different naming conventions
3. **Additional reporting**: Enhance the log output with more detailed information
4. **Interactive mode**: Add prompts for user confirmation before making changes
5. **Configuration options**: Add support for a configuration file to control behavior

## Notes

- The script handles nested block comments and string literals correctly
- Variable names that appear in comments or string literals are preserved
- The script can process REXX files with multiple statements per line
- Stem variables (ending with a period) are properly identified and preserved
- When processing a directory, a summary report of all processed files is generated

## Limitations

- The script may not handle all edge cases in complex REXX syntax
- Variable detection is based on assignment operations only

## Code Structure Analysis

The script is organized as a collection of procedures and functions, with a main processing loop that handles directory traversal. The main procedure `RXMigrate` is exposed to allow it to be called for each file in a directory.

Key design patterns used:
- XOR encoding for protecting strings and comments
- Bucket-based variable categorization
- Line-by-line processing for memory efficiency
- Recursive directory traversal
- Careful handling of stem variables

The code demonstrates good REXX practices including:
- Proper error handling
- Clear variable naming
- Modular design with separate procedures
- Efficient string manipulation
- Thorough documentation 