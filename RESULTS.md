# UI lab results

Tool parts that I chose: Part 3 (Robot Framework) and Part 4 (Cypress)

## Part 0
- Step 0.1, Chrome version: 157.0.8103.38 (Official Build) (64-bit) (cohort: 157.0.8103.38 Rollout) 
- Step 0.3, ChromeDriver version: ChromeDriver 157.0.8103.38 (a733b5afbb3ba618844ff8876b89ad1a774b2f18-refs/branch-heads/8103@{#1034})
- Step 0.4, locator of Pizza, Please!: button[name='pizza-please']
- Step 0.4, locator of Excluded tools: css=select
- Step 0.4, locator of Must be vegetarian: id=default-checkbox
- Step 0.4, locator of Custom Pizza Name: input#pizza-name
- Step 0.5, pizza name, tool and calories of the run by hand: Lab Pizza 20261106-201500, Scissors, 480 calories

| Step | Actual result | Pass or fail |
|------|---------------|--------------|
| 1 | The heading reads Looking to break out of your pizza routine? | Pass |
| 2 | Max Calories per Slice, Excluded tools, Must be vegetarian and Custom Pizza Name appear | Pass |
| 3 | The fields show 600, Knife selected, vegetarian checked, Lab Pizza 20261106-201500 | Pass |
| 4 | Pizza name shows Lab Pizza 20261106-201500, Tool shows Scissors (not Knife), calories 480 (<= 600) | Pass |
| 5 | The page shows message Please log in first. | Pass |
| 6 | Navigated to /admin, signed in with admin/admin, page displays Latest pizza recommendations | Pass |
| 7 | Found pizza Lab Pizza 20261106-201500 in list with tool Scissors | Pass |


## Part 3: Robot Framework
- robot --version: Robot Framework 7.5.1 (Python 3.13.11 on win32)
- Step 3.2, failure message for the wrong title: Title should have been 'Web Form' but was 'Web form'
- Step 3.8, run 1, result, elapsed time and pizza name: Pass, 13s
- Step 3.8, run 2, result, elapsed time and pizza name: Pass, 16s


## Part 4: Cypress
- node --version, npm --version and npx cypress version: node v22.20.0, npm 10.9.3, Cypress package 16.2.1 (binary 16.2.1)
