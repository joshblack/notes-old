# `ReactFiberRoot`

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
