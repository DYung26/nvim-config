- [ ] 

--------------------------------------------------------------------------------
# UNTRACKED; ONE-LINE; MULTIPLE DIRECTORIES

Run `git status` to identify untracked files. For **each of the following untracked directories**, process them **one at a time, in the order provided**:

```
.backup_seed/examples/
src/gateway/admin/
src/gateway/partners/decorators/
src/gateway/partners/projects/
src/gateway/shared/
src/gateway/testers/decorators/
src/gateway/testers/profile/
src/modules/
src/shared/cache/
src/shared/database/repositories/
src/shared/guards/
src/shared/interceptors/
src/shared/security/
```

For **each directory**, and for **each file inside that directory (recursively)**:

1. Open and read the file to understand its purpose and responsibility.
2. Generate a **one-line Conventional Commit–style message** that accurately describes what the file introduces.

   * Use an appropriate commit type (`feat`, `fix`, `chore`, `docs`, `refactor`, `test`, etc.).
   * Keep the subject line concise but descriptive.
3. Stage **only that file** using `git add`.
4. Commit the file **individually** using the generated commit message.

Complete all files in the current directory before moving on to the next directory.

Do not batch multiple files into a single commit.
Do not modify any file contents.
Do not include any additional output.

--------------------------------------------------------------------------------
UNTRACKED; ONE-LINE; ONE-DIRECTORY

Run `git status` to identify untracked files. For the following untracked **directory** only:

```

```

For **each file inside this directory (recursively)**:

1. Open and read the file to understand its purpose and responsibility.
2. Generate a **one-line Conventional Commit–style message** that accurately describes what the file introduces.

   * Use an appropriate commit type (`feat`, `fix`, `chore`, `docs`, `refactor`, `test`, etc.).
   * Keep the subject line concise but descriptive.
3. Stage **only that file** using `git add`.
4. Commit the file **individually** using the generated commit message.

Do not batch multiple files into a single commit.
Do not modify any file contents.
Do not include any additional output.

--------------------------------------------------------------------------------
UNTRACKED; ONE-LINE; ONE-FILE

Run `git status` to identify untracked files. For the following untracked **file** only:

```
'C:\Users\oyeku\LeetLab\DailyQuestions\2026-02-03\3637.TrionicArrayI-mine.py'
```

1. Open and read the file to understand its purpose and responsibility.
2. Generate a **one-line Conventional Commit–style message** that accurately describes what the file introduces.

   * Use an appropriate commit type (`feat`, `fix`, `chore`, `docs`, `refactor`, `test`, etc.).
   * Keep the subject line concise but descriptive.
3. Stage **only this file** using `git add`.
4. Commit the file **individually** using the generated commit message.

Do not modify the file contents.
Do not include any additional output.

--------------------------------------------------------------------------------
MODIFIED; ONE-LINE; ONE-FILE

Run `git diff` on the following file only:

```
.gitignore
```

From the diff, generate **one detailed, single-line Conventional Commit message** that summarizes **all changes in this file**:

* Use the format: `type(scope): detailed summary`
* Choose the most appropriate commit type (`feat`, `fix`, `refactor`, `chore`, etc.)
* The summary must be **descriptive and information-dense**, while remaining on **one line only**
* Do **not** include bullet points, line breaks, or body text

Output **only** the one-line commit message and nothing else.

--------------------------------------------------------------------------------
# UNTRACKED; ONE-LINE EACH

Run `git status` to identify **all untracked files** in the codebase.

For **each untracked file**:

1. Open and read the file to understand its purpose and responsibility.
2. Generate a **one-line Conventional Commit–style message** that accurately describes what the file introduces.

   * Use an appropriate commit type (`feat`, `fix`, `chore`, `docs`, `refactor`, `test`, etc.).
   * Keep the subject line concise but descriptive.
3. Stage **only that file** using `git add`.
4. Commit the file **individually** using its generated commit message.

Do not batch multiple files into a single commit.
Do not modify file contents.

Repeat until all untracked files are committed.

--------------------------------------------------------------------------------
# MODIFIED; MULTI-LINE

Run `git –no-pager diff` on the repository to identify all modified files. From the diff, generate a **standard multi-line Conventional Commit message** where:

* The header line (`type(scope): summary`) provides a high-level summary of **all** changes
* The body contains **detailed bullet points**, each clearly describing an individual change, its purpose, or its impact

Save the commit message exactly as plain text to:

```
~/scripts/lazy.txt
```

Do not produce any additional output.

--------------------------------------------------------------------------------
MODIFIED; ONE-LINE

Run `git –no-pager diff` on the repository to identify all modified files.

From the diff, generate **one single-line Conventional Commit message** that summarizes **all changes**:

* Use the format: `type(scope): summary`
* Choose the most appropriate commit type (`feat`, `fix`, `refactor`, `chore`, etc.)
* Make the summary **as detailed as necessary for clarity**, but no more verbose than required
* Keep the entire message on **one line only**
* Do **not** include bullet points, line breaks, or body text

Output **only** the one-line commit message and nothing else.

--------------------------------------------------------------------------------

Run `git diff` on the following file only:

```
<FILE_PATH>
```

From the diff, generate **one detailed, single-line Conventional Commit message** that summarizes **all changes in this file**:

* Use the format: `type(scope): detailed summary`
* Choose the most appropriate commit type (`feat`, `fix`, `refactor`, `chore`, etc.)
* The summary must be **descriptive and information-dense**, while remaining on **one line only**
* Do **not** include bullet points, line breaks, or body text

Output **only** the one-line commit message and nothing else.

--------------------------------------------------------------------------------
