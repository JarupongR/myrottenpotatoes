Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, "kc5RAacRMlyZ9ZyvUXRaFfeNi", "EVp3Jl9WBzS2J7yvcx2i4nET4sg3DG6tl2nnuBpXyPyM6rhPLL"
  end