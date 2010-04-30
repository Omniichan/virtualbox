module VirtualBox
  module COM
    module Interface
      module Version_3_1_X
        class FirmwareType < AbstractEnum
          map [:bios, :efi, :efi32, :efi64, :efidual]
        end
      end
    end
  end
end