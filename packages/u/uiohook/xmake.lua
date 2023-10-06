package("libuiohook")

    set_homepage("https://github.com/kwhat/libuiohook")
    set_description("A multi-platform C library to provide global keyboard and mouse hooks from userland.")
    add_urls("https://github.com/kwhat/libuiohook.git")
    add_versions("1.3", "f5ef7828a6ea2da9a57ab1d284addc2dd983becf")
    if is_plat("windows") then
    add_deps("cmake")
    elseif is_plat("macosx") then
    add_deps("cmake")
    else
        add_deps("cmake", "libxcb", "libx11", "libxkbcommon", "libxtst")
    end
    on_install(function (package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:is_debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)
package_end()
