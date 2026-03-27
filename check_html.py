from html.parser import HTMLParser

class TagChecker(HTMLParser):
    def __init__(self):
        super().__init__()
        self.stack = []
        self.errors = []

    def handle_starttag(self, tag, attrs):
        if tag not in ['img', 'br', 'hr', 'input', 'link', 'meta']:
            self.stack.append((tag, self.getpos()))

    def handle_endtag(self, tag):
        if tag in ['img', 'br', 'hr', 'input', 'link', 'meta']:
            return
        if not self.stack:
            self.errors.append(f"Unexpected closing tag </{tag}> at {self.getpos()}")
            return
        start_tag, pos = self.stack.pop()
        if start_tag != tag:
            self.errors.append(f"Mismatched tag: expected </{start_tag}> (from {pos}), found </{tag}> at {self.getpos()}")

file_path = r'c:\Users\Ayush\OneDrive\Desktop\kmj\listings_preview.html'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

checker = TagChecker()
checker.feed(content)

if checker.errors:
    print("Found HTML errors:")
    for err in checker.errors:
        print(err)
else:
    print("No structural HTML errors found.")

if checker.stack:
    print("Unclosed tags:")
    for tag, pos in checker.stack:
        print(f"<{tag}> at {pos}")
