function InterfaceLookup() { 
   
}

InterfaceLookup.prototype.getLookupId = function() {
    return this.LookupId;
}

InterfaceLookup.prototype.setLookupId  = function(LookupId) {
    this.LookupId = LookupId;
}

InterfaceLookup.prototype.getKey = function() {
    return this.Key;
}

InterfaceLookup.prototype.setKey = function(Key) {
    this.Key = Key;
}

InterfaceLookup.prototype.getValue = function() {
    return this.Value;
}

InterfaceLookup.prototype.setValue = function(Value) {
    this.Value = Value;
}

InterfaceLookup.prototype.getInterfaceName = function() {
    return this.InterfaceName;
}

InterfaceLookup.prototype.setInterfaceName = function(InterfaceName) {
    this.InterfaceName = InterfaceName;
}

InterfaceLookup.prototype.getModifiedBy = function() {
    return this.ModifiedBy;
}

InterfaceLookup.prototype.setModifiedBy = function(ModifiedBy) {
    this.ModifiedBy = ModifiedBy;
}

InterfaceLookup.prototype.getCreatedBy = function() {
    return this.CreatedBy;
}

InterfaceLookup.prototype.setCreatedBy = function(CreatedBy) {
    this.CreatedBy = CreatedBy;
}

module.exports = InterfaceLookup; 

