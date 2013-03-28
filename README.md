EPubReader
==========

EPubReader阅读器

EPubController是对外的接口，所以的操作通过EPubController来完成。
EPubBook为EPub书籍解析类，读取EPub书籍，解析相关信息。
EPub存储相关章节信息，相关信息在解析时写入。
EPubBookmark为书签信息，由EPubBookmarkManager来管理。
EPubChapterListView为章节列表。
EPubView为阅读视图，展示相关章节详细内容; 一次展示一章。
EPubConfig为相关宏定义。
