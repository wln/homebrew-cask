class Kaleidoscope < Cask
  version '2.1.0_134'
  sha256 'e16360273fb6d37560c7974b95728d82a0482268641753c49f903bf36445d35b'

  url 'http://cdn.kaleidoscopeapp.com/releases/Kaleidoscope-2.1.0-134.zip'
  appcast 'https://updates.blackpixel.com/updates?app=ks',
          :sha256 => '80eafc0b115e6f9ad4ec0cdec87809f21a3fc7ff1c540722f74d86dad64da158'
  homepage 'http://www.kaleidoscopeapp.com/'
  license :commercial

  app 'Kaleidoscope.app'
  binary 'Kaleidoscope.app/Contents/Resources/bin/ksdiff'

  postflight do
    # Don't ask to move the app bundle to /Applications
    system '/usr/bin/defaults', 'write', 'com.blackpixel.kaleidoscope', 'moveToApplicationsFolderAlertSuppress', '-bool', 'true'
  end
  caveats do
    files_in_usr_local
  end
end
