class TaskImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :compressed do
   resize_to_fit(928, nil)
  end

  version :large, :from_version => :compressed do
   # process :crop_large
   resize_to_fit(680, 680)
  end

  version :medium, :from_version => :large do
   resize_to_fit(540, 540)
  end

  version :small, :from_version => :large do
   resize_to_fit(400, 400)
  end

  version :extrasmall, :from_version => :large do
   resize_to_fit(294, 294)
  end

  version :xxs, :from_version => :large do
   resize_to_fit(144, 144)
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w(jpg jpeg png)
  end



  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{secure_token(10)}.#{file.extension}" if original_filename
  end

  protected

    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end

  end
