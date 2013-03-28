EPubReader
==========

EPubReader阅读器

* **EPubController**是对外的接口，所以的操作通过EPubController来完成。

* **EPubBook**为EPub书籍解析类，读取EPub书籍，解析相关信息。

* **EPub**存储相关章节信息，相关信息在解析时写入。

* **EPubBookmark**为书签信息，由EPubBookmarkManager来管理。

* **EPubChapterListView**为章节列表。

* **EPubView**为阅读视图，展示相关章节详细内容; 一次展示一章。

* **EPubConfig**为相关宏定义。
