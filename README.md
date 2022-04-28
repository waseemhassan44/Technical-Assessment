# Technical-Assessment

This project is technical assessment for copper. It is created using MVVM architecture and CoreData for persistence. Because of big data set, project is using batch insertion in background to avoid UI freezing. Once data is saved in CoreData, application always use it rather then downloading from server. It supports both dard/light mode. We can improve it further for following features:

1. Coordincator/router for screen navigation
2. Proper error handling, can be done in separate component
3. Brand naming conventions can be used across project
4. Accessiblity can be added for disability 
5. Unit/UI Tests, snapshot testing
6. Crashlytics for tracking of any crash
