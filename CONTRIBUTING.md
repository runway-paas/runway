# Contributing to Runway

Short version: pick an issue, branch, small PR, one approval, merge.

## 1. Pick something to work on
- Take an issue from the [board](https://github.com/orgs/runway-paas/projects) and assign yourself.
- If there is no issue then create one, allows for the board to be true

## 2. Make a branch
- Name it `<issue number>-<short-name>`, for example `12-cli-login`.
- Commit messages: short and start with a verb, e.g. `Add kind cluster script`.

## 3. Open a PR
- Keep it small: one issue, ideally under 300 lines.
- Fill in the template. Put `Closes #<issue number>` on its own line.
- Run the formatters first (`terraform fmt`, `gofmt`). CI checks them.
- Add the other person as reviewer. `main` needs one approval to merge.

## 4. Review
- Review within 48 hours if you can.
- Say what you checked, not just "LGTM". At least one specific comment or question.
- Approve, or request changes with a clear reason.

## 5. Azure rules
- Build locally on kind. Azure is for sessions only.
- Post **Azure up** in #azure before `terraform apply`, and **Azure down** after `terraform destroy`.
- Never create things by clicking in the portal. Everything goes through Terraform.
- Only the Terraform state storage stays running.

## 6. Stuck?
- Ask in #all-runaway. Incidents go in #incidents.
- Detail on how we work: see "Runway: How We Work" in the shared Drive folder.