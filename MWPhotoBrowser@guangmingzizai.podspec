Pod::Spec.new do |s|

  s.name = 'MWPhotoBrowser@ouxionghui’
  s.version = '2.2.2'
  s.license = 'MIT'
  s.summary = 'A simple iOS photo and video browser with optional grid view, captions and selections.'
  s.description = <<-DESCRIPTION
                  MWPhotoBrowser can display one or more images or videos by providing either UIImage
                  objects, PHAsset objects, or URLs to library assets, web images/videos or local files.
                  The photo browser handles the downloading and caching of photos from the web seamlessly.
                  Photos can be zoomed and panned, and optional (customisable) captions can be displayed.
                  Forked from: https://github.com/mwaterfall/MWPhotoBrowser, and add custom functions.
                  DESCRIPTION
  s.screenshots = [
    'https://raw.github.com/guangmingzizai/MWPhotoBrowser/master/Screenshots/MWPhotoBrowser1.png',
    'https://raw.github.com/guangmingzizai/MWPhotoBrowser/master/Screenshots/MWPhotoBrowser2.png',
    'https://raw.github.com/guangmingzizai/MWPhotoBrowser/master/Screenshots/MWPhotoBrowser3.png',
    'https://raw.github.com/guangmingzizai/MWPhotoBrowser/master/Screenshots/MWPhotoBrowser4.png',
    'https://raw.github.com/guangmingzizai/MWPhotoBrowser/master/Screenshots/MWPhotoBrowser5.png',
    'https://raw.github.com/guangmingzizai/MWPhotoBrowser/master/Screenshots/MWPhotoBrowser6.png'
  ]

  s.homepage = 'https://github.com/oxionghui/MWPhotoBrowser'
  #s.homepage = 'https://github.com/guangmingzizai/MWPhotoBrowser'
  s.author = { 'Wang JianFei' => 'guangmingzizai@gmail.com' }

  s.source = {
    :git => 'https://github.com/oxionghui/MWPhotoBrowser.git',
    #:git => 'https://github.com/guangmingzizai/MWPhotoBrowser.git',
    :tag => '2.2.2'
  }
  s.platform = :ios, '7.0'
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MWPhotoBrowser' => ['Pod/Assets/*.png']
  }
  s.requires_arc = true

  s.frameworks = 'ImageIO', 'QuartzCore', 'AssetsLibrary', 'MediaPlayer', 'Accelerate'
  s.weak_frameworks = 'Photos'

  s.dependency 'MBProgressHUD', '~> 0.9'
  s.dependency 'DACircularProgress', '~> 2.3'
  s.dependency 'pop', '~> 1.0'


  # SDWebImage
  # 3.7.2 contains bugs downloading local files
  # https://github.com/rs/SDWebImage/issues/1109
  s.dependency 'SDWebImage', '~> 4.0'

end
