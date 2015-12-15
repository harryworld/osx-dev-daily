Outline View
============

This is a demo on view-based Source List, which shows a list of Playlist like those in iTunes.

Setup in Interface Builder
--------------------------

The binding is setup in Interface builder

- For the playlists storage, add an Object and set its class to `NSMutableArray`.
- Add a Tree Controller and set the newly created `playlists` object as its content connection.
- Setup the Tree Controller so set the Children KeyPath to `children` and the leaf KeyPath to `isLeaf`. The `Playlist` class always returns `true` for `isLeaf`.
- Bind the **Table Column** of the `NSOutlineView` to the **Tree Controller** with the **Controller Key** of `arrangedObjects`.
- Bind the text field of the given cell (`DataCell`) to **Table Cell View** with the **Model Key Path** of `objectValue.name` which has to correspond with the data, that the **Tree Controller** is provided with.
    
- Despite the binding some things need to be set in code to achieve the following:

    - Tell the `NSOutlineView` which cell to use

Credit
------

Inspired by [OutlineView in ObjC](https://github.com/besi/mac-quickies)
