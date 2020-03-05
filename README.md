# Former Repository for Azure Pipelines VM images for Microsoft-hosted CI/CD

This repository has been replaced by [virtual-environments](https://github.com/actions/virtual-environments) repo. If you have an issue or request for an image, please create an issue in the [virtual-environments](https://github.com/actions/virtual-environments) repo.

## Rolling Brownouts for vs2015-win2012r2, macOS-10.13, win1803

Starting March 9, 2020, there will be one hour blocks where builds and releases using vs2015-win2012r2, macOS-10.13, win1803 will fail. These images are being removed on March 23, 2020 and these brownout windows are meant to bring awareness to allow customers time to react before the images are completely removed. There will be up to three of these one hour brownout a day starting March 9th, 2020.

## Image removal on March 23, 2020

On March 23, 2020 we are removing the following images:

- Windows Server 2012R2 with Visual Studio 2015, a.k.a vs2015-win2012r2
- macOS X High Sierra 10.13, a.k.a macOS-10.13
- Windows Server Core 1803, a.k.a win1803

Please see https://devblogs.microsoft.com/devops/removing-older-images-in-azure-pipelines-hosted-pools/ for more details and guidance on updating to newer images.

## Following image updates for Windows Container until March 23rd, 2020
You can follow releases for the Windows Container virtual machine image [here](https://github.com/Microsoft/azure-pipelines-image-generation/releases). 

## Contributing	
Contribution requests will not be actively monitored. Please use [virtual-environments](https://github.com/actions/virtual-environments).

Most contributions require you to agree to a	
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
