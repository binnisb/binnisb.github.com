---
title:  "First dive into Azure, functions and arm"
date:   2018-04-08 22:00:00 +0100
categories: dev
tags: vsts azure functions C# arm 
---

I played around with [Azure functions][az-func] the other day. I started by creating and developing one in the online editor, which was fun to get started and test it out directly. Once I had my basic function accepting HTTP POST and doing something useful, I moved the code to a git repo in [VSTS][vsts]. I decided to target `netstandard2.0` to use `AzureFunctionsVersion v2`. It took me some time to figure out how to add NuGet packages (I'm using Visual Studio Code to create projects and code) until I realised they are added as `PackageReference` under `ItemGroup`.

 Here is an example of a `*.csproj` file.

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>netstandard2.0</TargetFramework>
    <AzureFunctionsVersion>v2</AzureFunctionsVersion>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Microsoft.NET.Sdk.Functions" Version="1.0.9" />
  </ItemGroup>
  <ItemGroup>
    <None Update="host.json">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </None>
    <None Update="local.settings.json">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
      <CopyToPublishDirectory>Never</CopyToPublishDirectory>
    </None>
    <None Update="functionsConfig*\*.json">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
      <CopyToPublishDirectory>PreserveNewest</CopyToPublishDirectory>
    </None>
  </ItemGroup>
</Project>
```

I also created an ARM template for deploying the code, which also copies X509 certificates from KeyVault to the function app to use for encrypting a rest connection to external API. Since this was my first encounter with Azure (Function App, Key Vault, first C\# in a long time, ARM), the process has taken me some weeks, though I had the function up and running in a couple of days. The next time I do something similar, I want to look into C\# testing frameworks to do BDD / TDD.


[vsts]:   https://www.visualstudio.com/team-services/
[az-func]: https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview


