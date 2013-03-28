EPubReader
==========

EPubReader阅读器：Libraries里的EPubReader为Epub的解析部分，其它的（Category、FMDB、TouchXML、ZipArchive等）为支持的类库。

根目录下的EPubReader为写的Demo，Demo为基于StoryBoard。
整个项目基于ARC，需要iOS5.0以上。

EPubController是对外的接口，所以的操作通过EPubController来完成。
EPubBook为EPub书籍解析类，读取EPub书籍，解析相关信息。
EPub存储相关章节信息，相关信息在解析时写入。
EPubBookmark为书签信息，由EPubBookmarkManager来管理。
EPubChapterListView为章节列表。
EPubView为阅读视图，展示相关章节详细内容; 一次展示一章。
EPubConfig为相关宏定义。

目前完成的功能
1.解析EPub书籍的相关属性。
2.阅读及进度控制。
3.书签的保存读取等。

待完成功能
1.阅读进度计算
2.整本书加载阅读，替换为每次只加载单章。
3其它更多功能。
