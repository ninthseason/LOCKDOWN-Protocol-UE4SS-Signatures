最后更新：250801

**汉化方法：**

将压缩包中所有文件解压至游戏根目录即可

游戏根目录形如：`D:\SteamLibrary\steamapps\common\LOCKDOWN Protocol\LockdownProtocol\Binaries\Win64`

*解压到Win64文件夹内*




致谢：

0. RE-UE4SS 提供的UE通用插件框架 https://github.com/UE4SS-RE/RE-UE4SS 
1. XoF-eLtTiL 提供的翻译插件 https://github.com/XoF-eLtTiL/LockdownProtocol-TC （亦提供了繁体版翻译）
2. 轩辕阁 提供的简体版翻译 （抱歉并未找到发布页）




对新版封锁协议(UE5.5.4)的支持由Kl1nge5(https://steamcommunity.com/id/ninth_season/)提供

如果你想知道是如何支持新版本的：

1. 从源代码编译RE-UE4SS，因为当前官方预编译的RE-UE4SS不支持UE5.5.4
2. 逆向分析得到FText::FromString的AOB作为FText_Constructor （注意，不是UE4SS文档中所说的FText::FText的AOB！）



### Changelog

- 0.0.3 -> 1.0.0

  修改了汉化插件，修复了随时有概率导致游戏崩溃的问题。

  事实上，只是因为在调用对象方法前没有验证对象是否仍存在而导致的问题。
