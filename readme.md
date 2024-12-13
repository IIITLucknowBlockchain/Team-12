

# **Blockchain Proposal: Food Supply Chain Transparency**

## **Overview**
This project is a blockchain-based solution designed to improve transparency in the food supply chain. It records and tracks information about produce, from farming to the table, ensuring that every step is verifiable, secure, and trustworthy. The smart contract used in this project is written in Solidity.

This repository includes all the files you need to understand, test, and validate the solution.

---

## **What’s Included**
1. **Proposal Document (PDF):** A detailed explanation of the project idea and implementation plan.
2. **Dataset (CSV):** Sample data representing the produce records for testing.
3. **Smart Contract (Solidity Code):** The main blockchain program used to manage and verify data.
4. **README.md:** This file, explaining how to use the code and validate it step by step.

---

## **What You Need to Start**
To test and validate the code, you will need:
- **Remix Ethereum IDE**: An online tool for writing and deploying Solidity contracts.  
  [Go to Remix Ethereum IDE](https://remix.ethereum.org/).  
- **A Test Blockchain Environment**:  
  - Use Remix’s built-in blockchain (Remix VM) or  
  <!-- - Use a local blockchain simulator like **Ganache**: [Download Ganache](https://trufflesuite.com/ganache/). -->
- **Google Chrome or Firefox**: To use Remix without compatibility issues.

---

## **Step-by-Step Guide**

### **1. Open and Deploy the Contract**
1. Open [Remix Ethereum IDE](https://remix.ethereum.org/).
2. Create a new file named `TraceSupplyChain.sol`.
3. Copy and paste the Solidity code from this repository into the file.
4. **Compile the Contract:**
   - Select the Solidity compiler version `0.8.0` from the compiler tab.
   - Click on the **Compile ProduceSupplyChain.sol** button.
5. **Deploy the Contract:**
   - Go to the "Deploy & Run Transactions" tab.
   - Select **Remix VM (JavaScript VM)** as the environment.
   - Click the **Deploy** button. This deploys the contract to a simulated blockchain.

---

### **2. Add Records to the Blockchain**
1. Once the contract is deployed, you’ll see a list of functions in the Remix interface.
2. Use the `addRecordToBatch` function to add a record.  
   - Each record should include:
     - `batchId`: Unique ID for the product batch (e.g., "BATCH123").
     - `FarmID`: Farm's unique identifier (e.g., "F001").
     - `ProduceType`: Type of produce (e.g., "Tomatoes").
     - `HarvestDate`: Date of harvest (e.g., "2024-06-10").
     - `QualityScore`: Score for quality (1-10, where 10 is the best).
     - `ProcessingDate`: Date the produce was processed (e.g., "2024-06-12").
     - `DistributorID`: Distributor’s unique identifier (e.g., "D001").
     - `RetailerID`: Retailer’s unique identifier (e.g., "R001").

Example Input:
```
batchId: "BATCH123"
FarmID: "F001"
ProduceType: "Tomatoes"
HarvestDate: "2024-06-10"
QualityScore: 9
ProcessingDate: "2024-06-12"
DistributorID: "D001"
RetailerID: "R001"
```
3. Repeat for multiple records to simulate different stages of the supply chain.

---

### **3. Retrieve and Validate Data**
Use the following functions to test and verify the records stored in the blockchain:

- **`getBatchHistoryCount(batchId)`**
  - Input: `batchId` (e.g., "BATCH123").
  - Output: Number of records in the batch.
  - Example: Calling this for "BATCH123" might return `2`, indicating two records exist.

- **`getBatchRecord(batchId, index)`**
  - Input: `batchId` and `index` (e.g., `0` for the first record).
  - Output: Details of the specific record (FarmID, ProduceType, etc.).
  - Example: Calling this for "BATCH123", `0` will return the details of the first record.

- **`countBatchRecordsAboveQuality(batchId, minScore)`**
  - Input: `batchId` and `minScore` (e.g., `8`).
  - Output: Number of records in the batch with `QualityScore` greater than or equal to `minScore`.
  - Example: Calling this for "BATCH123" with `8` might return `1`.

---

### **4. Use the Sample Dataset**
1. Open the `sample_data.csv` file in this repository.
2. Manually input the data into the `addRecordToBatch` function using Remix, or convert the CSV data into Solidity-friendly input format.

---

## **Optional: Advanced Validation**
If you're familiar with Node.js or Web3.js, you can:
1. Write a script to load the CSV file and programmatically call the contract functions.
2. Automate adding large datasets and verifying the output.

---

## **FAQs**

### **What does this project do?**
This project uses blockchain to make the food supply chain transparent and secure. It tracks every step of the journey, from farm to consumer, ensuring no data is tampered with.

### **Can I test the contract without coding?**
Yes! Remix’s graphical interface allows you to test all functions without writing additional code.

### **What tools are required for advanced users?**
Advanced users can use **Ganache**, **Node.js**, and **Web3.js** for more extensive testing.

---

## **References**
- [Remix Ethereum IDE](https://remix.ethereum.org/)
- [Ganache - Local Blockchain Simulator](https://trufflesuite.com/ganache/)
- [Solidity Documentation](https://soliditylang.org/docs/)
- [Web3.js Documentation](https://web3js.readthedocs.io/)

---

This README is designed to help you understand, set up, and test the smart contract with ease. If you encounter any issues, feel free to reach out or open an issue in this repository.