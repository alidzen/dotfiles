#!/usr/bin/env node

import { execSync, spawnSync } from "child_process";

function fsb(patterns) {
  console.log("Patters: ", patterns);
  try {
    const branches = execSync("git branch --all", { encoding: "utf8" })
      .split("\n")
      .map((line) => line.trim())
      .filter((line) => line.toLowerCase().includes(patterns.toLowerCase()))
      .join("\n");

    console.log(branches);
    if (!branches) {
      console.log("[fsb] No branch matches the provided pattern");
      return;
    }

    const fzf = spawnSync("fzf-tmux", ["-p", "--reverse", "-1", "-0", "+m"], {
      input: branches,
      encoding: "utf8",
    });
    if (fzf.status === 130) {
      process.exit(0);
    }

    const selectedBranch = fzf.stdout.trim();
    console.log("selectedBranches", selectedBranch);
    if (!selectedBranch) {
      console.log("[fsb] no branch selected");
      return;
    }

    // remotes/origin/HEAD -> origin/main
    const lastAfterSlashReg = /^(.*\/)/;
    const branch = selectedBranch.replace(lastAfterSlashReg, "");
    console.log("branch", branch);
  } catch (e) {
    console.error("/nError to pick branches");
  }
}

const args = process.argv.slice(2).join(" ");
fsb(args);
