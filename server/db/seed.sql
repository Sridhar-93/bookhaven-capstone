INSERT INTO books(title,author,category,brand,price,old_price,rating,delivery,cover_color,description) VALUES
('The Art of Focus','Daniel Reed','Personal Growth','Northstar Press',399,499,4.8,'Tomorrow','gold','A practical guide to building deep focus, meaningful routines and a calmer working life.'),
('The Art of Learning','Maya Collins','Personal Growth','Northstar Press',349,429,4.7,'Tomorrow','coral','A thoughtful guide to learning faster, remembering more and staying curious.'),
('The Path to Success','Ethan Brooks','Business','Summit House',599,699,4.9,'2 days','teal','Build a sustainable path to success through clear goals and consistent action.'),
('Beneath the Stars','Ava Bennett','Fiction','Bluebird Books',449,549,4.6,'Tomorrow','navy','An uplifting story about friendship, courage and finding your place in the world.'),
('The Quiet Mind','Noah Williams','Wellness','Bluebird Books',299,379,4.5,'3 days','sage','Simple ideas for creating more space, balance and peace in everyday life.'),
('The Last Frontier','Olivia Carter','Fiction','Summit House',529,649,4.7,'2 days','orange','A gripping adventure across unfamiliar lands and unexpected discoveries.'),
('The Joy of Minimalism','Daniel Reed','Lifestyle','Northstar Press',399,479,4.8,'Tomorrow','yellow','Make room for what matters with a practical approach to intentional living.'),
('The Power of Habits','Mia Foster','Personal Growth','Summit House',379,449,4.6,'Tomorrow','blue','Small daily changes that help you build habits that last.'),
('The Creative Code','Leo Martin','Technology','Pixel House',699,799,4.9,'3 days','purple','Explore the ideas and tools behind modern creative technology.'),
('A Map of Memories','Grace Lee','Fiction','Bluebird Books',429,499,4.5,'2 days','pink','A warm novel about family, memory and the places that shape us.')
ON CONFLICT DO NOTHING;
