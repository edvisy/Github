function PdfSettings() { 
   
}

PdfSettings.prototype.getPk = function() {
    return this.Pk;
}

PdfSettings.prototype.setPk = function(Pk) {
    this.Pk = Pk;
}

PdfSettings.prototype.getFromEmail = function() {
    return this.FromEmail;
}

PdfSettings.prototype.setFromEmail = function(FromEmail) {
    this.FromEmail = FromEmail;
}

PdfSettings.prototype.getCustomerCode = function() {
    return this.CustomerCode;
}

PdfSettings.prototype.setCustomerCode = function(CustomerCode) {
    this.CustomerCode = CustomerCode;
}

PdfSettings.prototype.getCustomerName = function() {
    return this.CustomerName;
}

PdfSettings.prototype.setCustomerName = function(CustomerName) {
    this.CustomerName = CustomerName;
}

PdfSettings.prototype.getCustomerEAN = function() {
    return this.CustomerEAN;
}

PdfSettings.prototype.setCustomerEAN = function(CustomerEAN) {
    this.CustomerEAN = CustomerEAN;
}

PdfSettings.prototype.getUnitPriceFactor = function() {
    return this.UnitPriceFactor;
}

PdfSettings.prototype.setUnitPriceFactor = function(UnitPriceFactor) {
    this.UnitPriceFactor = UnitPriceFactor;
}

PdfSettings.prototype.getModifiedBy = function() {
    return this.ModifiedBy;
}

PdfSettings.prototype.setModifiedBy = function(ModifiedBy) {
    this.ModifiedBy = ModifiedBy;
}

PdfSettings.prototype.getCreatedBy = function() {
    return this.CreatedBy;
}

PdfSettings.prototype.setCreatedBy = function(CreatedBy) {
    this.CreatedBy = CreatedBy;
}

module.exports = PdfSettings;
