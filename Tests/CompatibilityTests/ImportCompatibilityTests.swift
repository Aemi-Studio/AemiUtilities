import AemiUtilities
import Testing

@Test
func `legacy product exposes the shared Aemi implementation`() {
  let values = [10, 20]
  #expect(values[guard: 1] == 20)
  #expect(values[guard: nil] == nil)
  #expect(values[guard: 2] == nil)
}
