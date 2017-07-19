function New-LabVMSnapshot {
<#
    .SYNOPSIS
        Creates a snapshot of all virtual machines with the specified snapshot name.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)] [ValidateNotNullOrEmpty()]
        [System.String[]] $Name,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)] [ValidateNotNullOrEmpty()]
        [System.String] $SnapshotName
    )
    process {
        foreach ($vmName in $Name) {

            WriteVerbose -Message ($localized.CreatingVirtualMachineSnapshot -f $vmName, $SnapshotName);
            Checkpoint-VM -VMName $vmName -SnapshotName $SnapshotName;
        } #end foreach VM

    } #end process
} #end function
