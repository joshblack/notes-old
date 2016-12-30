# `ReactFiberRoot`

This module exports the following function:

```js
createFiberRoot(containerInfo: any): FiberRoot
```

This function creates an `uninitializedFiber` by calling out to `createHostRootFiber` from `ReactFiber`. It then constructs a `root` POJO to represent a `FiberRoot`, and creates a circular reference by setting `stateNode` on `uninitializedFiber` to be `root`. `root` is then returned.

## Module

This module imports the following modules:

```js
const {
  createHostRootFiber
} = require('ReactFiber');
```

This module imports the following types:

```js
import type { Fiber } from 'ReactFiber';
```

Finally, it exports the following `named` exports:

```js
createFiberRoot(containerInfo: any): FiberRoot
```

And exports the following types:

```js
export type FiberRoot = {
  // Any additional information from the host associated with this root.
  containerInfo: any,

  // The currently active root fiber. This is the mutable root of the tree.
  current: Fiber,

  // Determines if this root has already been added to the schedule for work.
  isScheduled: boolean,

  // The work schedule is a linked list.
  nextScheduledRoot: ?FiberRoot,

  // Top context object, used by renderSubtreeIntoContainer
  context: ?Object,

  pendingContext: ?Object,
};
```
