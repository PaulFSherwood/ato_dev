from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import QUrl


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.browser = QWebEngineView()
        # Load the OSM map
        # self.browser.setUrl("https://www.openstreetmap.org")
        self.browser.setUrl(QUrl("https://www.openstreetmap.org"))

        self.setCentralWidget(self.browser)

if __name__ == '__main__':
    app = QApplication([])
    window = MainWindow()
    window.show()
    app.exec_()
