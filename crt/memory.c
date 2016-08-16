#include <malloc.h>
#include <string.h>
#include <coreinit/baseheap.h>
#include <coreinit/expandedheap.h>

void *
memalign(size_t alignment,
         size_t size)
{
   return MEMAllocFromExpHeapEx(MEMGetBaseHeapHandle(MEM_BASE_HEAP_MEM2), size, alignment);
}

void *
malloc(size_t size)
{
   return memalign(4, size);
}

void
free(void *ptr)
{
   if (ptr) {
      MEMFreeToExpHeap(MEMGetBaseHeapHandle(MEM_BASE_HEAP_MEM2), ptr);
   }
}

size_t
malloc_usable_size(void *ptr)
{
   return MEMGetSizeForMBlockExpHeap(ptr);
}

void *
realloc(void *ptr,
        size_t size)
{
   if (!ptr) {
      return malloc(size);
   }

   if (malloc_usable_size(ptr) >= size) {
      return ptr;
   }

   void *realloc_ptr = malloc(size);

   if (!realloc_ptr) {
      return NULL;
   }

   memcpy(realloc_ptr, ptr, malloc_usable_size(ptr));
   free(ptr);

   return realloc_ptr;
}

void *
calloc(size_t num,
       size_t size)
{
   void *ptr = malloc(num*size);

   if (ptr) {
      memset(ptr, 0, num*size);
   }

   return ptr;
}

void *
valloc(size_t size)
{
   return memalign(64, size);
}

void *
_memalign_r(struct _reent *r,
            size_t alignment,
            size_t size)
{
   return memalign(alignment, size);
}

void *
_malloc_r(struct _reent *r,
          size_t size)
{
   return malloc(size);
}

void
_free_r(struct _reent *r,
        void *ptr)
{
   return free(ptr);
}

void *
_realloc_r(struct _reent *r,
           void *ptr,
           size_t size)
{
   return realloc(ptr, size);
}

void *
_calloc_r(struct _reent *r,
          size_t num,
          size_t size)
{
   return calloc(num, size);
}

size_t
_malloc_usable_size_r(struct _reent *r,
                      void *ptr)
{
   return malloc_usable_size(ptr);
}

void *
_valloc_r(struct _reent *r,
          size_t size)
{
   return valloc(size);
}
