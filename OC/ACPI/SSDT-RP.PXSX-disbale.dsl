DefinitionBlock ("", "SSDT", 2, "OCLT", "noRPxx", 0x00000000)
{
    External (_SB.PCI0.SAT0.NVM1, DeviceObj)

    Scope (_SB.PCI0.SAT0.NVM1)
    {
        OperationRegion (DE01, PCI_Config, 0x50, One)
        Field (DE01, AnyAcc, NoLock, Preserve)
        {
                ,   4, 
            DDDD,   1
        }

        Method (_STA, 0, Serialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
        }
    }

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI0.SAT0.NVM1.DDDD = One
        }
    }
}
