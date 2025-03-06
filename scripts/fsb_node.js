#!/usr/bin/env node

import { execSync, spawnSync } from "child_process";

function fsb(patterns) {
  try {
    // TODO advanced: asynchronyosly update results for fzf-tmux
    // execSync("git fetch");

    const branches = execSync("git branch --all", { encoding: "utf8" })
      .split("\n")
      .map((line) => line.trim())
      .filter((line) => line.toLowerCase().includes(patterns.toLowerCase()))
      .join("\n");

    if (!branches) {
      execSync(
        `tmux display-message "[fsb] No branch matches the provided pattern"`,
      );
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
    if (!selectedBranch) {
      execSync(`tmux display-message "[fsb] no branch selected"`);
      return;
    }

    const lastAfterSlashReg = /^(.*remotes\/)/;
    let branch = selectedBranch.replace(lastAfterSlashReg, "");
    if (branch.includes("HEAD")) {
      branch = branch.split(" ")[2];
    }
    try {
      const checkBranch = execSync(`git checkout ${branch}`);
      execSync(`display-message "Checkout to ${checkBranch}"`);
    } catch (e) {
      const err = e.message.split("\n").join(", ");

      execSync(
        `tmux display-popup -E "echo ${err}; echo 'Press enter to close...'; read"`,
        { encoding: "utf8" },
      );
    }
  } catch (e) {
    console.table(e);
    console.error("\n[fsb] error to pick branches:", e?.message);
  }
}

const args = process.argv.slice(2).join(" ");
fsb(args);
