typedef struct JobDescription {
  int JobID;
  int JobType;
  int numThreads;
  int params;
} JobDescription;

typedef struct QueueRecord {
  JobDescription* Array;
  int Capacity;
  int Rear;
  int Front;
  int ReadLock;
} QueueRecord;
__kernel void A(__global QueueRecord* a, __global JobDescription* b, __global QueueRecord* c, __global JobDescription* d, int e, __global char* f) {
  __private int g = 32;

  __local JobDescription h[32];

  __private int i = get_local_id(0) % g;
  __private int j = get_local_id(0) / g;

  __private int k;
  for (k = 0; k < e; k++) {
    if (i == 0) {
      while (a->ReadLock != 0) {
      }
      if (a->ReadLock == 0)
        a->ReadLock = 1;

      __private int l = 0;
      while ((a->Rear + 1) % a->Capacity == a->Front)
        l++;

      h[j] = b[a->Front];

      a->Front = (a->Front + 1) % (a->Capacity);

      a->ReadLock = 0;
    }

    if (i < (h[j].numThreads)) {
      h[j].params = 1;
    }

    if (i == 0) {
      while (c->ReadLock != 0) {
      }
      if (c->ReadLock == 0)
        c->ReadLock = 1;

      __private int l = 0;
      while ((c->Rear + 1) % c->Capacity == c->Front)
        l++;

      __private int m = (c->Rear + 1) % (c->Capacity);

      d[m] = h[j];

      c->Rear = m;

      c->ReadLock = 0;
    }
  }
}