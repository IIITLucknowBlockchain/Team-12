// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProduceSupplyChain {
    struct ProduceRecord {
        string FarmID;
        string ProduceType;
        string HarvestDate;
        uint QualityScore;
        string ProcessingDate;
        string DistributorID;
        string RetailerID;
    }

    // Each batchId maps to a list of records, representing the product's journey
    mapping(string => ProduceRecord[]) private batchHistory;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    /**
     * @dev Add a new produce record to a specific batch.
     * This allows building a chain of records: Farm, Processing, Distribution, Retail steps.
     */
    function addRecordToBatch(
        string memory batchId,
        string memory _FarmID,
        string memory _ProduceType,
        string memory _HarvestDate,
        uint _QualityScore,
        string memory _ProcessingDate,
        string memory _DistributorID,
        string memory _RetailerID
    ) public onlyOwner {
        ProduceRecord memory newRecord = ProduceRecord({
            FarmID: _FarmID,
            ProduceType: _ProduceType,
            HarvestDate: _HarvestDate,
            QualityScore: _QualityScore,
            ProcessingDate: _ProcessingDate,
            DistributorID: _DistributorID,
            RetailerID: _RetailerID
        });
        batchHistory[batchId].push(newRecord);
    }

    /**
     * @dev Get the total number of records for a given batchId.
     * This tells us how many steps have been recorded in the product journey.
     */
    function getBatchHistoryCount(string memory batchId) public view returns (uint) {
        return batchHistory[batchId].length;
    }

    /**
     * @dev Retrieve a single record from a batch by its index.
     * Allows front-end apps to get each step in the chain and display it to the end-user.
     */
    function getBatchRecord(string memory batchId, uint index) public view returns (
        string memory FarmID,
        string memory ProduceType,
        string memory HarvestDate,
        uint QualityScore,
        string memory ProcessingDate,
        string memory DistributorID,
        string memory RetailerID
    ) {
        require(index < batchHistory[batchId].length, "Invalid index");
        ProduceRecord memory rec = batchHistory[batchId][index];
        return (
            rec.FarmID,
            rec.ProduceType,
            rec.HarvestDate,
            rec.QualityScore,
            rec.ProcessingDate,
            rec.DistributorID,
            rec.RetailerID
        );
    }

    /**
     * @dev Count how many records in a batch meet or exceed a certain quality score.
     * Useful for analytics or ensuring product quality standards.
     */
    function countBatchRecordsAboveQuality(string memory batchId, uint minScore) public view returns (uint) {
        uint count = 0;
        ProduceRecord[] memory records = batchHistory[batchId];
        for (uint i = 0; i < records.length; i++) {
            if (records[i].QualityScore >= minScore) {
                count++;
            }
        }
        return count;
    }

    /**
     * @dev Verify if a specific record in a batch meets a required quality score.
     * Helpful for quick checks, e.g., ensuring the final product step is of high quality.
     */
    function verifyBatchRecordQuality(string memory batchId, uint index, uint requiredQuality) public view returns (bool) {
        require(index < batchHistory[batchId].length, "Invalid index");
        ProduceRecord memory rec = batchHistory[batchId][index];
        return (rec.QualityScore >= requiredQuality);
    }

    /**
     * @dev Transfer ownership of the contract.
     * This can be useful if the supply chain network’s administration changes.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid owner address");
        owner = newOwner;
    }
}
