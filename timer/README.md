# Timer

It is the example from the third chapter in Packt's [Flutter Projects](https://www.packtpub.com/product/flutter-projects/9781838647773) book, first edition from April 2020. It is vaguely based on the concepts from Cal Newport's book Deep Work.

&nbsp; 
## Things learnt

* Custom widgets
* [Layout Builder](https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html) - allows for a more dynamic layout choices. 
* [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html), [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) and [asynchronous programming](https://dart.dev/tutorials/language/streams) in Flutter
* [Navigation](https://docs.flutter.dev/development/ui/navigation), ~~settings~~ and menus ([MenuButton](https://api.flutter.dev/flutter/material/PopupMenuButton-class.html))
* [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html) Layout

```
Stream<TimerModel> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
        return TimerModel(...);
    }
}
```

## Problems 

The example in the book had number of issues throught. I was able to resolve, most of them, but an attempt at using `shared_preferences` resulted repetitively in errors with [CocoaPods](https://cocoapods.org/). 

```
Error output from CocoaPods:
↳

    [!] Automatically assigning platform `iOS` with version `9.0` on target `Runner` because no platform was specified. Please specify a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.
    /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': dlopen(/Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi_c.bundle, 9): no suitable image found.  Did find: (LoadError)
    	/Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi_c.bundle: mach-o, but wrong architecture
    	/Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi_c.bundle: mach-o, but wrong architecture - /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi_c.bundle
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi.rb:5:in `rescue in <top (required)>'
    	from /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi.rb:2:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/ethon-0.15.0/lib/ethon.rb:3:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/typhoeus-1.4.0/lib/typhoeus.rb:2:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:440:in `download_typhoeus_impl_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:372:in `download_and_save_with_retries_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:365:in `download_file_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:338:in `download_file'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:53:in `refresh_metadata'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source.rb:31:in `initialize'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:30:in `initialize'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:315:in `new'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:315:in `block in source_from_path'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:322:in `source_from_path'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `block in aggregate_with_repos'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `map'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `aggregate_with_repos'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:26:in `aggregate'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:60:in `all'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface/error_report.rb:173:in `repo_information'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface/error_report.rb:77:in `stack'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface/error_report.rb:24:in `report'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/command.rb:66:in `report_error'
    	from /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:396:in `handle_exception'
    	from /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:337:in `rescue in run'
    	from /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:324:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/command.rb:52:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/bin/pod:55:in `<top (required)>'
    	from /usr/local/bin/pod:23:in `load'
    	from /usr/local/bin/pod:23:in `<main>'
    /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': cannot load such file -- 2.6/ffi_c (LoadError)
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi.rb:3:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/ethon-0.15.0/lib/ethon.rb:3:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/typhoeus-1.4.0/lib/typhoeus.rb:2:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:440:in `download_typhoeus_impl_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:372:in `download_and_save_with_retries_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:365:in `download_file_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:338:in `download_file'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:53:in `refresh_metadata'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source.rb:31:in `initialize'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:30:in `initialize'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:315:in `new'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:315:in `block in source_from_path'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:322:in `source_from_path'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `block in aggregate_with_repos'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `map'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `aggregate_with_repos'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:26:in `aggregate'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:60:in `all'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface/error_report.rb:173:in `repo_information'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface/error_report.rb:77:in `stack'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface/error_report.rb:24:in `report'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/command.rb:66:in `report_error'
    	from /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:396:in `handle_exception'
    	from /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:337:in `rescue in run'
    	from /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:324:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/command.rb:52:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/bin/pod:55:in `<top (required)>'
    	from /usr/local/bin/pod:23:in `load'
    	from /usr/local/bin/pod:23:in `<main>'
    /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': dlopen(/Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi_c.bundle, 9): no suitable image found.  Did find: (LoadError)
    	/Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi_c.bundle: mach-o, but wrong architecture
    	/Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi_c.bundle: mach-o, but wrong architecture - /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi_c.bundle
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi.rb:5:in `rescue in <top (required)>'
    	from /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi.rb:2:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/ethon-0.15.0/lib/ethon.rb:3:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/typhoeus-1.4.0/lib/typhoeus.rb:2:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:440:in `download_typhoeus_impl_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:372:in `download_and_save_with_retries_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:365:in `download_file_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:338:in `download_file'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:53:in `refresh_metadata'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source.rb:31:in `initialize'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:30:in `initialize'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:315:in `new'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:315:in `block in source_from_path'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:322:in `source_from_path'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `block in aggregate_with_repos'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `map'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `aggregate_with_repos'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:26:in `aggregate'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:60:in `all'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:393:in `source_with_url'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/sources_manager.rb:22:in `find_or_create_source_with_url'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:178:in `block in sources'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:177:in `map'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:177:in `sources'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:1077:in `block in resolve_dependencies'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface.rb:64:in `section'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:1076:in `resolve_dependencies'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:124:in `analyze'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer.rb:416:in `analyze'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer.rb:241:in `block in resolve_dependencies'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface.rb:64:in `section'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer.rb:240:in `resolve_dependencies'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer.rb:161:in `install!'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/command/install.rb:52:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:334:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/command.rb:52:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/bin/pod:55:in `<top (required)>'
    	from /usr/local/bin/pod:23:in `load'
    	from /usr/local/bin/pod:23:in `<main>'
    /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': cannot load such file -- 2.6/ffi_c (LoadError)
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.4/lib/ffi.rb:3:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/ethon-0.15.0/lib/ethon.rb:3:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/typhoeus-1.4.0/lib/typhoeus.rb:2:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:440:in `download_typhoeus_impl_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:372:in `download_and_save_with_retries_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:365:in `download_file_async'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:338:in `download_file'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:53:in `refresh_metadata'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source.rb:31:in `initialize'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/cdn_source.rb:30:in `initialize'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:315:in `new'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:315:in `block in source_from_path'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:322:in `source_from_path'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `block in aggregate_with_repos'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `map'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:331:in `aggregate_with_repos'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:26:in `aggregate'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:60:in `all'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-core-1.11.2/lib/cocoapods-core/source/manager.rb:393:in `source_with_url'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/sources_manager.rb:22:in `find_or_create_source_with_url'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:178:in `block in sources'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:177:in `map'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:177:in `sources'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:1077:in `block in resolve_dependencies'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface.rb:64:in `section'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:1076:in `resolve_dependencies'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer/analyzer.rb:124:in `analyze'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer.rb:416:in `analyze'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer.rb:241:in `block in resolve_dependencies'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/user_interface.rb:64:in `section'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer.rb:240:in `resolve_dependencies'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/installer.rb:161:in `install!'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/command/install.rb:52:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:334:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/lib/cocoapods/command.rb:52:in `run'
    	from /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.2/bin/pod:55:in `<top (required)>'
    	from /usr/local/bin/pod:23:in `load'
    	from /usr/local/bin/pod:23:in `<main>'

Error running pod install
Error launching application on iPhone 13.
```