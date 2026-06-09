# Copilot Instructions For HL7 EU Imaging IG

Use these instructions when working with AI assets in this repository.

## AI Files In This IG

- Use `.github/skills/*/SKILL.md` for task-specific guidance.
- Use `.github/agents/*` to understand available agent roles and specializations.
- Use `.github/workflows/*` to align changes with CI/build expectations when relevant.

## How To Use AI Files

- Pick the most specific skill for the user task before running commands.
- Follow the skill's required inputs, execution steps, and output format.
- Prefer repository scripts referenced by skills over ad-hoc command variants.
- For IG build or preprocess work, run the scripts exactly from the repository root unless the skill says otherwise.
- Keep changes minimal and scoped to the ticket or request.

## Question Style In This Project

- Use `vscode_askQuestions` when a user needs to answer by clicking on options or when a task benefits from a constrained multiple-choice prompt.
- Prefer click-based questions over freeform text for discrete choices in this project.

## Validation Expectations

- If a skill defines verification steps, run them and report pass/fail clearly.
- If verification cannot be run, state what is missing and why.
