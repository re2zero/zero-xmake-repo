package("boost_sml")
    set_kind("library", {headeronly = true})
    set_homepage("https://boost-ext.github.io/sml")
    set_description("SML: C++14 State Machine Library")
    set_license("BSL-1.0")

    add_urls("https://github.com/boost-ext/sml/archive/refs/tags/$(version).tar.gz",
             "https://github.com/boost-ext/sml.git")

    add_versions("v1.1.12", "65b53b3b839881512a5bf5bd443afd7dd64a406c706aab469f2e7cfd1d0a6012")
    add_versions("v1.1.11", "8773efd639ce9649dc449135c8c53232e1cb5f4037d44be02c1b9ccc343f246d")
    add_versions("v1.1.8", "d2626b2fd249fa0788ca364a2f8dcb4762dd72195f86d43370e4cad4c02262c5")

    add_deps("cmake")

    on_install(function (package)
        import("package.tools.cmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <boost/sml.hpp>
            namespace sml = boost::sml;
            struct e2 {
                bool value = true;
            };
            void test() {
                auto event2 = sml::event<e2>;
            }
        ]]}, {configs = {languages = "c++20"}}))
    end)
