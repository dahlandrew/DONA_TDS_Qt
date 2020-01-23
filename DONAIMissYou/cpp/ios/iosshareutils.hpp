/*For iOS sharing
  Header for C-Obj files
  From @ekkescorner
*/

#ifndef __IOSSHAREUTILS_H__
#define __IOSSHAREUTILS_H__

#include "cpp/shareutils.hpp"

class IosShareUtils : public PlatformShareUtils
{
    Q_OBJECT

public:
    explicit IosShareUtils(QObject *parent = 0);
    bool checkMimeTypeView(const QString &mimeType);
    bool checkMimeTypeEdit(const QString &mimeType);
    void share(const QString &text, const QUrl &url);
    void sendFile(const QString &filePath, const QString &title, const QString &mimeType, const int &requestId, const bool &altImpl);
    void viewFile(const QString &filePath, const QString &title, const QString &mimeType, const int &requestId, const bool &altImpl);
    void editFile(const QString &filePath, const QString &title, const QString &mimeType, const int &requestId, const bool &altImpl);

    void handleDocumentPreviewDone(const int &requestId);

public slots:
    void handleFileUrlReceived(const QUrl &url);


};

#endif
