---
name: analyze-stock-fundamentals
description: Perform a fundamentals analysis of a given stock.
---

# Stock Fundamentals Analysis

A skill for analyzing fundamentals of a particular stock.

## Process

### 1. Analyze Income Statement

  - Check if following fields are increasing quarter over quarter:
    - `Total Revenue`
    - `Gross Profit`
    - `Operating Income`
    - `Net Income`
    - `Diluted EPS`
    - `Gross Margin`(calculated as: `Gross Profit` / `Total Revenue`)
    - `Operating Margin` (calculated as: `Operating Income` / `Total Revenue`)
    - `Net Margin` (calculated as: `Net Income` / `Total Revenue`)

  - Check if targets for following fields are met:
    - `Operating Margin` larger than 15%
    - `Net Margin` increasing larger than 20% (indicates moat)

### 2. Analyze Balance Sheet

  - Check if following fields are increasing quarter over quarter:
    - `Total Assets`
    - `Total Equity Gross Minority Interest`
    - `Current Assets`
    - `Stockholders Equity`
    - `Retained Earnings`
    - `ROE` (calculated as: `Net Income` / `Stockholders Equity`)
    - `ROA`
    - `Warren Buffet's Bonity` (calculates as: 4 * `Net Income`/ `Long Term Debt`)

  - Check if following fields are decreasing quarter over quarter:
    - `Total Liabilities Net Minority Interest`
    - `Total Debt`
    - `Long Term Debt And Capital Lease Obligation`
    - `Long Term Debt`
    - `Current Liabilities`
    - `Share Issued`
    - `Total Debtness` (calculated as: `Total Liabilities Net Minority Interest` / `Total Assets`)
    - `Current Debtness` (calculated as: `Current Liabilities` / `Current Assets`)

  - Check if targets for following fields are met:
    - `ROE` larger than 10%
    - `Warren Buffet's Bonity` larger than 100%

### 3. Analyze Cashflow Statement

  - Check if following fields are increasing quarter over quarter:
    - `Free Cash Flow`
    - `Operating Cash Flow`

  - Check if following fields are decreasing quarter over quarter:
    - `Issuance Of Capital Stock`
    - `Repurchase Of Capital Stock`
    - `Cash Dividends Paid`
    - `Warren Buffet's CapEx to Net Income` (calculated as: `Capital Expenditure` / `Net Income`)

  - Check if targets for following fields are met:
    - `Warren Buffet's CapEx to Net Income` less than 25% (perfect) or less than 50% (ok)

### 4. Calculate Fair Value
  - Calculate fair price using discounted cash flow model.
  - Calculate fair price using EPS.

