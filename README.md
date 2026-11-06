# UI Testing Lab: Robot Framework and Cypress

This repository contains automated UI tests for Selenium's Web Form and QuickPizza demo web applications as part of the ITDS362 Software Quality Assurance and Testing course (Version 2.0).

## Selected Tool Parts
- **Part 3: Robot Framework** (Python 3.13 / SeleniumLibrary)
- **Part 4: Cypress** (Node.js 22 LTS / JavaScript)

---

## Folders and Test Execution

### 1. `robot/`
The `robot/` folder contains automated UI test suites written in Robot Framework using SeleniumLibrary to drive Chrome via ChromeDriver. It includes tests for the web form (`first.robot`, `web_form.robot`), the full QuickPizza scenario (`pizza_scenario.robot`), page keywords in `resources/quickpizza.resource`, and test evidence in `results/`.

**Run Command:**
```bash
robot -d results/run1 -v BROWSER:headlesschrome pizza_scenario.robot
```
*(Run inside the `robot/` directory with Python virtual environment active)*

---

### 2. `cypress/`
The `cypress/` folder contains automated end-to-end UI tests written in Cypress (JavaScript) targeting modern web applications. It includes specs for the web form (`web-form.cy.js`) and the complete QuickPizza scenario (`pizza-scenario.cy.js`) with custom admin login commands, network interception (`cy.intercept`), and recorded evidence in `screenshots/` and `videos/`.

**Run Command:**
```bash
npx cypress run --browser chrome
```
*(Run inside the `cypress/` directory)*

---

## Prerequisites
- **Google Chrome**: 157.0.8103.38+
- **ChromeDriver**: Matching Chrome version, path set in environment variable `CHROMEDRIVER`
- **Python**: 3.10+ (tested with Python 3.13)
- **Node.js**: 22+ LTS (tested with Node v22.20.0 and npm 10.9.3)
