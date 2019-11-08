
# ![Azure Pipelines](/help/resources/DevOpsIconPipelines40.png "Azure Pipelines") Azure Pipelines VM images for Microsoft-hosted CI/CD

## Overview

This repo contains scripts that generate the Linux and Windows virtual machine images used by [Azure Pipelines](https://azure.microsoft.com/en-us/services/devops/pipelines/?nav=min) for [Microsoft-hosted CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/hosted?view=vsts&tabs=yaml). The macOS image scripts are not kept here, but its contents are documented here. The images are generated using [Packer](https://www.packer.io/).

## Following image updates
You can follow releases [here](https://github.com/Microsoft/azure-pipelines-image-generation/releases). Consider enabling **Watch -> Releases only** at the top of the page.

## Notifications
Subscribe to [this RSS feed](https://microsoft.github.io/azure-pipelines-image-generation/) to be notified of upcoming image changes and other important messages. General Azure Pipelines service health is found [here](https://status.dev.azure.com/).

# Image contents

- [macOS 10.13](images/macos/macos-10.13-Readme.md)
- [macOS 10.14](images/macos/macos-10.14-Readme.md)
- Ubuntu 16.04 [![](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=Ubuntu16&badge=1&azp=1)](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=Ubuntu16&redirect=1&azp=1)
- VS 2019 + Windows Server 2019 [![](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=windows-2019-vs2019&badge=1&azp=1)](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=windows-2019-vs2019&redirect=1&azp=1)
- VS 2017 + Windows Server 2016 [![](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=VS2017&badge=1&azp=1)](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=VS2017&redirect=1&azp=1)
- [VS 2015 + Windows Server 2012 R2](images/win/Vs2015-Server2012R2-Readme.md)
- Windows Container 1803 [![](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=WINCON&badge=1&azp=1)](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=WINCON&redirect=1&azp=1)

## Issues and requests

If you have an issue or request for an image, please create an issue in this repo. To add or change a tool yourself, see [Contributing](#contributing).

## Image generation help

### Linux

- [How to use Packer to create Linux VM images in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/build-image-with-packer)

### Windows

- [Instructions to build Windows images](/help/CreateImageAndAzureResources.md)
- [How to use Packer to create Windows VM images in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/build-image-with-packer)

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Legal Notices

Microsoft and any contributors grant you a license to the Microsoft documentation and other content
in this repository under the [Creative Commons Attribution 4.0 International Public License](https://creativecommons.org/licenses/by/4.0/legalcode),
see the [LICENSE](LICENSE) file, and grant you a license to any code in the repository under the [MIT License](https://opensource.org/licenses/MIT), see the
[LICENSE-CODE](LICENSE-CODE) file.

Microsoft, Windows, Microsoft Azure and/or other Microsoft products and services referenced in the documentation
may be either trademarks or registered trademarks of Microsoft in the United States and/or other countries.
The licenses for this project do not grant you rights to use any Microsoft names, logos, or trademarks.
Microsoft's general trademark guidelines can be found at http://go.microsoft.com/fwlink/?LinkID=254653.

Privacy information can be found at https://privacy.microsoft.com/en-us/

Microsoft and any contributors reserve all others rights, whether under their respective copyrights, patents,
or trademarks, whether by implication, estoppel or otherwise.
