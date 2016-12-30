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

This module leverages the following local types:

And exports the following types:

```js
type FiberRoot = {
  // Any additional information from the host associated with this root.
  
  // The currently active root fiber. This is the mutable root of the tree.
  containerInfo: any 
  
  // Determines if this root has already been added to the schedule for work.
  current: Fiber 

  // The work schedule is a linked list.
  isScheduled: boolean
  
  // Top context object, used by renderSubtreeIntoContainer
  nextScheduledRoot: ?FiberRoot

  context: ?Object;
  pendingContext: ?Object;
};
```
