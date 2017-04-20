// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "ProviderGithub",
    dependencies: [
       .Package(url: "https://github.com/MatthewYork/DateTools.git", majorVersion: 2),
   ]
)
