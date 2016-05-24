Pod::Spec.new do |s|
  s.name         = "AGImagePickerControllerForSport"
  s.version      = "2.0.2"
  s.summary      = "AGImagePickerController is a image picker controller that allows you to select multiple photos and can be used for all iOS devices."
  s.homepage     = "https://github.com/arturgrigor/AGImagePickerController"
  s.license      = 'MIT'
  s.author       = { "Artur Grigor" => "arturgrigor@gmail.com" }
  s.source       = { :git => "https://github.com/jiangyancong/AGImagePickerController.git",
                    :branch => 'master'
                    #:tag => s.version.to_s
                    }
  s.platform     = :ios, '7.0'
  s.source_files = 'AGImagePickerController/*.{h,m}'
  s.resources    = 'AGImagePickerController/AGImagePickerController.bundle'
  s.framework    = 'AssetsLibrary','CoreLocation','QuartzCore','CoreGraphics'
  s.requires_arc = true
end
