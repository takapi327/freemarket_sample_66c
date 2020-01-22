module OmniauthMacros
  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: "facebook",
        uid: "123456789",
        info: {
          name: "takao",
          email: "takao@example.com",
        }
      })
  end
  OmniAuth.config.test_mode = true #OmniAuthが呼ばれたら実際の通信を行わずにテストモードに入ることを意味する
end