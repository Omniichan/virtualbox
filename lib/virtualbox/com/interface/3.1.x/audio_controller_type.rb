module VirtualBox
  module COM
    module Interface
      module Version_3_1_X
        class AudioControllerType < AbstractEnum
          map [:ac97, :sb16]
        end
      end
    end
  end
end