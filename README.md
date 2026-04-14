# Linux Course

This branch contains the Linux course material for **hamakRobotTeam**, focused on AI and robotics foundations (Raspberry Pi + ROS context).

## Branch Notes

- This branch uses a **single-source course file** (`linux-course.md`) instead of per-chapter directories.
- The generated outputs (`linux-course.tex`, `linux-course.pdf`) are included in the repository.

## Repository Contents

- `linux-course.md`: Main editable source for the full course.
- `linux-course.tex`: LaTeX output generated from the Markdown source.
- `linux-course.pdf`: Final rendered course PDF.
- `Linux_course_hierarchy/Linux_Course_Hierarchy.md`: High-level hierarchy/outline.
- `markdownToPdf.sh`: Script used to build the PDF from Markdown.
- `LICENSE`: Project license file.

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/KhaledMahfouz5/linux-course.git
   cd linux-course
   ```

2. Read the source content:

   ```bash
   less linux-course.md
   ```

3. Build the PDF (optional):

   ```bash
   bash markdownToPdf.sh
   ```

## Prerequisites

- Basic programming knowledge (variables, conditions, loops, functions)
- A Linux environment (native install, VM, or WSL)
- Command-line familiarity
- Enough disk space for toolchains and packages (recommended: 30+ GB free)

## License

See [LICENSE](LICENSE) for licensing terms.
